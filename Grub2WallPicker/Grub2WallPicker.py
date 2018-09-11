import gi
import subprocess
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk


class Grub2WallPicker(Gtk.Window):

    def __init__(self):

        Gtk.Window.__init__(self, title="GRUB 2 Wallpaper Picker")

        # BUTTON
        self.button = Gtk.Button(label="Let's begin! Tap here.")
        # setting button props
        margin = 20
        self.button.props.margin_top = margin
        self.button.props.margin_left = margin
        self.button.props.margin_bottom = margin
        self.button.props.margin_right = margin
        self.button.connect("clicked", self.on_click)
        # add button to gtk view
        self.add(self.button)

    def on_click(self, widget):

        dialog = Gtk.FileChooserDialog("Where's your wallpaper?", self, Gtk.FileChooserAction.OPEN, (Gtk.STOCK_OPEN, Gtk.ResponseType.OK))

        file_filter = Gtk.FileFilter()
        file_filter.set_name("Images")
        file_filter.add_mime_type("image/jpeg")
        file_filter.add_mime_type("image/png")
        dialog.add_filter(file_filter)

        response = dialog.run()

        if response == Gtk.ResponseType.OK:
            self.sudo_edit_file(dialog.get_filename())
            dialog.destroy()
        else:
            dialog.destroy()
            self.create_message_dialog("Whoa, just a moment!", "You didn't select a wallpaper image. Consider selecting again.")

    def sudo_edit_file(self, path_to_wall):
        path_to_wall = str(path_to_wall)
        new_path_to_file = "/usr/share/GRUBWall/wall" + path_to_wall[path_to_wall.rindex("."):]
        subprocess.run(['pkexec', 'mkdir', '/usr/share/GRUBWall'])
        subprocess.run(['pkexec', 'cp', '-f', path_to_wall, new_path_to_file])
        with open('/etc/default/grub') as grub:
            with open('/tmp/grub_wall_changer', 'w') as new_grub:
                for line in grub:
                    if line.__contains__("GRUB_BACKGROUND"):
                        new_grub.write('GRUB_BACKGROUND="'+str(new_path_to_file)+'"\n')
                    else:
                        new_grub.write(line)
        subprocess.run(['pkexec', 'mv', '-f', '/tmp/grub_wall_changer', '/etc/default/grub'])
        subprocess.run(['pkexec', 'grub-mkconfig', '-o', '/boot/grub/grub.cfg'])
        self.create_message_dialog("Bingo!", "Done setting wallpaper! Do a reboot and thank me later.")

    def create_message_dialog(self, title, message):
        message_dialog = Gtk.MessageDialog(self, 0, Gtk.MessageType.INFO, Gtk.ButtonsType.OK, title)
        message_dialog.format_secondary_text(message)
        message_dialog.run()
        message_dialog.destroy()


win = Grub2WallPicker()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()

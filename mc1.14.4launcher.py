from tkinter import *
import subprocess

def launchmc():
    subprocess.call([r"Client.bat"])
    print("Minecraft is launching...")

app = Tk()
app.geometry('512x512')
app.title("MC 1.14.4 launcher (not official)")

Titletext = Label(text="Minecraft")
Titletext.pack()

Launchmcbtn = Button(text="Launch Minecraft 1.14.4",width=20,height=5,command=launchmc)
Launchmcbtn.pack()




app.mainloop()
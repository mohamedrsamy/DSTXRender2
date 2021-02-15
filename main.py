# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

from saxonc import *
import saxonc

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    with saxonc.PySaxonProcessor(license=False) as proc:
        print("Test Saxon/C on Python")
        print(proc.version)
        xdmAtomicval = proc.make_boolean_value(False)
        xslt30proc = proc.new_xslt30_processor()

    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/

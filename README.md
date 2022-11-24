# MCM-Template

Copy Paste mcm template for SkyUI
Includes logic for a bare bones 'addon system' to allow mods to integrate new pages to the main mods mcm

## Usage

### Template Base

To create a new MCM using this repository, I recommend copying the code itself into the new project, as there may be changes to this script and its well.. just a template to safe some time writing a mcm from scratch. If you do wish to use the addon system, follow these steps here:

1. Copy the contents of the Base Script into your own MCM Script
2. Build out the functions OnConfigInit() and OnPageReset() as usual
3. Edit SetPages() function as instructed in the code snippet. Make sure to edit the _OffSet variables to state the correct value
4. Build your MCM. There are only a limited amount of special syntax rules:
    * If you wish to hook the 'ST' type functions in the empty state, replace 'ST' with 'EX'. *EXAMPLE: Use OnSelextEX instead of OnSelextST*
5. Retype the 'MCMTemplatePage' class references to the custom extension class for your mod (see below)

### Template Page

To properly allow the MCM to be expanded, you need to define the actual page that is being added to the MCM, to do so we use inheritance to create a uniform base class that addon pages inherit from:

1. Create another script and copy the contents of the 'MCMTemplatePage' class into it
    * The class you create here should be referenced as the TemplatePage in the main MCM script
2. Retype the _ParentMCM property to the class of your main MCM

### Working with Addons:

An Author who wishes to expand your MCM with a new page, should create a new Script and have it extend the page script created in the step above. The behavior of this add on page is mimicing the behavior of a normal MCM almost entirely. There are only a few differences:

- There is no method OnConfigInit(). Use InitializePage() instead
- The OnPageReset() method has no argument and is only invoked when the specific page is called, not every time the player changes a page
- There is no OnConfigClose() or OnConfigOpen() Event



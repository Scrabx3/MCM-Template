# MCM-Template

Copy Paste mcm template for SkyUI
Includes logic for a bare bones 'addon system' to allow ot her mods to add pages to the main mods mcm

## Add On System (Usage)

Copy the base system into your mcm script and build out the SetPages(), OnConfigInit() and OnPageReset() as usual
There is nothing more to consider on the main script

Next create a new script and fill it with the contents of the "TemplatePage" script. If another mod wishes to extend your MCM with a new page, they have to simply create a new script and extend the "TempaltePage"-script you offer in your mod
Add On mods will need to create a new script for every page they wish to add, the syntax of this page mimics the default config menu for the most part. The only differences are:
- There is no method OnConfigInit(). Use InitializePage() instead
- The OnPageReset() method has no argument and is only invoked when the specific page is opened, not every time the player changes a page

# Hackintosh Configuration

Files that allow me to run macOS on my Asus N550JV laptop. Currently I am using OpenCore (0.5.9) with macOS Catalina (10.15.6).

## Notes

> To remind myself of gotchas that made my life a bit shorter

- are you sure you read _everything_ in the dortania guide?
- The ACPI tables were dumped with Clover (SSDTTime was giving the DSDT w/o SSDTs)
- Files were dissasembled with `./iasl -da -dl -f refs.txt DSDT.aml SSDT-*.aml`
- Leave CSM on to fix graphics
- Add the cursor byte size patch from 6MB (00006000) to 9MB because of some smaller graphics glitches: `framebuffer-cursormem 00009000`
- ALC layout 27 was needed to fix static noise in headphone jack (internal speakers worked with some others too)
- Just take your time and write your own patches (it is not that hard)


### TODO

- fix brightness & keyboard backlighting (PNLF, AsusSMC?)
- look into power management (Dortania Post-Install)
- update OC (& macOS?)
- write thanks to users and guides that made this possible

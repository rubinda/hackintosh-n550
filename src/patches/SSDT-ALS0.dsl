DefinitionBlock("", "SSDT", 2, "hack", "ALS0", 0)
{
    // Fake ALS device
    Device(_SB.ALS0)
    {
        Name(_HID, "ACPI0008")
        Name(_CID, "smc-als")
        Name(_ALI, 150)
        Name(_ALR, Package()
        {
            Package() { 100, 150 },
        })
    }
}
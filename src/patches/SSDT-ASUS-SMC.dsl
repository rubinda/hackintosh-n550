DefinitionBlock("", "SSDT", 2, "hack", "asmc", 0)
{
    External (_SB.ATKP, IntObj)
    External (_SB.ATKD, DeviceObj)
    External (_SB.ATKD.IANE, MethodObj)
    External (_SB.PCI0.LPCB.EC0, DeviceObj)
    External (_SB.PCI0.LPCB.EC0.WRAM, MethodObj)
    
   
    // Add the KBL patch for Haswell
    Scope (_SB.ATKD)
    {
        Method (SKBV, 1, NotSerialized)
        {
            \_SB.PCI0.LPCB.EC0.WRAM (0x04B1, Arg0)
            Return (Arg0)
        }   
    }
    
    // FN keys patch
    Scope (_SB.PCI0.LPCB.EC0)
    {
        // F3 key - decrease keyboard backlight
        Method (_Q0C, 0)
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0xC5)
            }
        }
        
        // F4 key - increase keyboard backlight
        Method (_Q0D, 0)
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0xC4)
            }
        }
        
        // F5 key - decrease brightness
        Method (_Q0E, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x20)
            }
        }
        
        // F6 key
        Method (_Q0F, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x10)
            }
        }
    }

}
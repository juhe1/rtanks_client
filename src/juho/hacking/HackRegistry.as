package juho.hacking {
   
   import juho.hacking.hacks.SpeedHack;
   import juho.hacking.Hack;
   
   public class HackRegistry {
      
      public static var speedHack:SpeedHack;
      
      public static var allHacks:Vector.<Hack>;
      
      public function HackRegistry() {
         allHacks = new Vector.<Hack>();
         speedHack = new SpeedHack()
         allHacks.push(speedHack);
      }
   }
}
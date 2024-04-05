package package_31
{
   import flash.system.Capabilities;
   import package_34.class_3;
   
   public class name_537 implements class_3
   {
       
      
      public function name_537()
      {
         super();
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc2_:String = "\n\nCapabilities\n";
         _loc2_ += "\n   os: " + Capabilities.os;
         _loc2_ += "\n   version: " + Capabilities.version;
         _loc2_ += "\n   playerType: " + Capabilities.playerType;
         _loc2_ += "\n   isDebugger: " + Capabilities.isDebugger;
         _loc2_ += "\n   language: " + Capabilities.language;
         return _loc2_ + ("\n   screenResolution: " + Capabilities.screenResolutionX + " x " + Capabilities.screenResolutionY);
      }
      
      public function get dumperName() : String
      {
         return "capabilities";
      }
   }
}

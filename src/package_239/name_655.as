package package_239
{
   import alternativa.tanks.sfx.name_132;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import package_4.ClientObject;
   import package_76.name_735;
   
   public interface name_655
   {
       
      
      function playSound(param1:Sound, param2:int = 0, param3:int = 0, param4:SoundTransform = null) : SoundChannel;
      
      function name_763(param1:SoundChannel) : void;
      
      function name_686() : void;
      
      function name_672(param1:name_132) : void;
      
      function name_696(param1:name_132) : void;
      
      function name_701() : void;
      
      function name_723(param1:int, param2:name_735) : void;
      
      function name_783(param1:ClientObject) : void;
      
      function set maxDistance(param1:Number) : void;
   }
}

package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.objects.SkyBox;
   import flash.display.DisplayObjectContainer;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   import package_4.ClientObject;
   import package_42.TanksCollisionDetector;
   import package_42.name_1155;
   import platform.client.fp10.core.type.name_70;
   
   public class name_128
   {
       
      
      public var bfObject:ClientObject;
      
      public var name_685:name_70;
      
      public var name_700:ClientObject;
      
      public var name_661:DisplayObjectContainer;
      
      public var viewport:BattleView3D;
      
      public var tanks:Dictionary;
      
      public var name_263:Dictionary;
      
      public var name_694:Dictionary;
      
      public var name_663:Dictionary;
      
      public var bonusTakenSound:Sound;
      
      public var battleFinishSound:Sound;
      
      public var ambientSound:Sound;
      
      public var name_664:SoundChannel;
      
      public var killSound:Sound;
      
      public var name_678:name_1155;
      
      public var name_247:TanksCollisionDetector;
      
      public var physTime:int;
      
      public var time:int;
      
      public var skybox:SkyBox;
      
      public var name_707:int;
      
      public var var_44:int;
      
      public function name_128()
      {
         this.tanks = new Dictionary();
         this.name_263 = new Dictionary();
         this.name_694 = new Dictionary();
         this.name_663 = new Dictionary();
         super();
      }
   }
}

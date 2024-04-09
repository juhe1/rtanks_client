package alternativa.tanks.models.battlefield
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.class_12;
   import alternativa.tanks.models.tank.class_15;
   import alternativa.tanks.models.tank.ITankEventDispatcher;
   import alternativa.tanks.models.tank.name_77;
   import alternativa.utils.removeDisplayObject;
   import base.class_122;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import package_12.name_24;
   import package_32.class_2;
   import package_32.name_245;
   import package_33.GameActionEnum;
   import package_343.ResistancesIcons;
   import package_48.UserTitle;
   import package_51.name_90;
   import package_58.name_112;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_70;
   
   public class AdditionUserTitleSwitcher implements class_15, class_2, AutoClosable
   {
      
      public static var battleInputService:name_245 = OSGi.getInstance().getService(name_245) as name_245;
      
      public static var display:name_24 = OSGi.getInstance().getService(name_24) as name_24;
      
      public static var battleEventDispatcher:ITankEventDispatcher = OSGi.getInstance().getService(ITankEventDispatcher) as ITankEventDispatcher;
      
      public static var battleService:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      public static var var_1461:class_12 = OSGi.getInstance().getService(class_12) as class_12;
      
      private static const const_1580:int = 34;
       
      
      private var var_1459:Bitmap;
      
      private var var_1460:Bitmap;
      
      private var var_1121:Boolean;
      
      public function AdditionUserTitleSwitcher()
      {
         super();
         battleEventDispatcher.name_718(name_77.LOADED,this);
         battleInputService.name_219(this);
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         if(param1 == GameActionEnum.SHOW_TANK_PARAMETERS)
         {
            UserTitle.var_447 = param2;
            if(this.var_1459 != null)
            {
               this.var_1459.visible = param2;
            }
            if(this.var_1460 != null)
            {
               this.var_1460.visible = param2;
            }
         }
      }
      
      public function handleTankEvent(param1:int, param2:TankData) : void
      {
         if(param2.local)
         {
            this.method_1673();
            this.method_1674();
            display.stage.addEventListener(Event.RESIZE,this.onResize,false,-1);
            this.method_1675();
            this.method_1676();
            this.var_1121 = true;
         }
      }
      
      private function onResize(param1:Event = null) : void
      {
         if(this.var_1459 != null)
         {
            this.var_1459.x = display.stage.stageWidth - this.var_1459.width >> 1;
            this.var_1459.y = display.stage.stageHeight - 103;
         }
         if(this.var_1460 != null)
         {
            this.var_1460.x = display.stage.stageWidth - this.var_1460.width >> 1;
            this.var_1460.y = display.stage.stageHeight - (this.var_1459 == null ? 123 : 163);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
      }
      
      private function method_1675() : void
      {
         var _loc1_:class_122 = null;
         _loc1_ = null;
         var _loc2_:name_90 = null;
         var _loc3_:Bitmap = null;
         var _loc4_:Bitmap = null;
         var _loc5_:BitmapData = null;
         _loc1_ = new class_122();
         _loc1_.visible = false;
         battleService.getBattlefieldData().name_661.addChild(_loc1_);
         var _loc6_:name_70 = var_1461.method_43();
         var _loc7_:name_112 = name_112(_loc6_.name_176(name_112));
         var _loc8_:Vector.<name_90> = _loc7_.method_501();
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc2_ = _loc8_[_loc9_];
            _loc3_ = new ResistancesIcons.name_2097();
            _loc3_.x = 34 * _loc9_;
            _loc1_.addChild(_loc3_);
            _loc4_ = new Bitmap(ResistancesIcons.name_2096(_loc2_.resistanceProperty));
            _loc4_.x = (_loc3_.width - _loc4_.width >> 1) + _loc3_.x;
            _loc4_.y = (_loc3_.height - _loc4_.height >> 1) + _loc3_.y;
            _loc1_.addChild(_loc4_);
            _loc9_++;
         }
         if(_loc1_.width != 0)
         {
            _loc5_ = new BitmapData(_loc8_.length * 34,34,true,0);
            _loc5_.draw(_loc1_);
            this.var_1459 = new Bitmap(_loc5_);
            battleService.getBattlefieldData().name_661.addChild(this.var_1459);
            this.var_1459.visible = UserTitle.var_447;
            this.onResize();
         }
      }
      
      private function method_1676() : void
      {
      }
      
      public function close() : void
      {
         battleInputService.name_150(this);
         this.method_1673();
         this.method_1674();
      }
      
      private function method_1673() : void
      {
         if(this.var_1459 != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
            removeDisplayObject(this.var_1459);
            this.var_1459.bitmapData.dispose();
            this.var_1459 = null;
         }
      }
      
      private function method_1674() : void
      {
         if(this.var_1460 != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
            removeDisplayObject(this.var_1460);
            this.var_1460.bitmapData.dispose();
            this.var_1460 = null;
         }
      }
   }
}

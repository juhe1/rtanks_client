package alternativa.tanks.gui.clanmanagement
{
   import base.class_122;
   import controls.name_1891;
   import controls.name_1922;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_13.Long;
   import package_190.name_571;
   import package_191.name_579;
   import package_212.name_587;
   import package_228.ClanAction;
   import package_25.name_52;
   import package_26.ClanInfoUpdateEvent;
   import package_26.name_62;
   import package_26.name_867;
   import package_29.name_64;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_566 extends class_122
   {
      
      public static var clanService:name_62;
      
      public static var clanMembersData:name_64;
      
      public static var clanUserInfoService:name_52;
      
      public static var localeService:name_102;
      
      private static const const_1529:int = 7;
      
      private static const const_422:int = 11;
      
      private static const const_1530:int = 30;
      
      public static const const_1534:int = 120;
       
      
      private var var_1234:Class;
      
      private var var_1231:Class;
      
      private var var_1233:Class;
      
      private var var_1232:Class;
      
      private var var_1224:name_1922;
      
      private var var_1222:WindowInner;
      
      private var var_1225:name_1922;
      
      private var var_1226:name_587;
      
      private var var_1223:name_1921;
      
      private var var_1228:name_1921;
      
      private var var_1229:name_1921;
      
      private var var_1227:name_1921;
      
      private var _width:int;
      
      private var _height:int;
      
      private var clanInfo:name_571;
      
      private var var_1230:ClanInfoUpdateEvent;
      
      private var description:name_1923;
      
      public function name_566(param1:name_70)
      {
         var _loc2_:Long = null;
         this.var_1234 = name_1926;
         this.var_1231 = name_1924;
         this.var_1233 = name_1925;
         this.var_1232 = name_1927;
         this.var_1226 = new name_587(ClanAction.EDIT_PROFILE);
         super();
         this.clanInfo = name_571(param1.name_176(name_571));
         this.var_1224 = new name_1922();
         this.var_1225 = new name_1922();
         addChild(this.var_1224);
         addChild(this.var_1225);
         this.var_1222 = new WindowInner(this._width,120,name_1891.name_1428);
         this.var_1224.addChild(this.var_1222);
         var _loc3_:name_579 = name_579(param1.name_176(name_579));
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for each(_loc2_ in _loc3_.name_1930())
         {
            _loc4_ += clanMembersData.method_361(_loc2_);
            _loc5_ += clanMembersData.method_367(_loc2_);
         }
         this.var_1223 = new name_1921(new this.var_1232() as Bitmap,localeService.getText(name_390.const_1195),"");
         this.method_1433();
         this.var_1228 = new name_1921(new this.var_1231() as Bitmap,localeService.getText(name_390.const_1125),_loc4_.toString());
         this.var_1229 = new name_1921(new this.var_1234() as Bitmap,localeService.getText(name_390.const_835),_loc5_.toString());
         this.var_1227 = new name_1921(new this.var_1233() as Bitmap,localeService.getText(name_390.const_600),"");
         if(_loc5_ == 0)
         {
            this.var_1227.setValue("0.00");
         }
         else
         {
            this.var_1227.setValue((Number(_loc4_) / _loc5_).toFixed(2));
         }
         this.var_1222.addChild(this.var_1223);
         this.var_1222.addChild(this.var_1228);
         this.var_1222.addChild(this.var_1229);
         this.var_1222.addChild(this.var_1227);
         this.description = new name_1923(this.clanInfo.method_1449());
         this.var_1225.addChild(this.description);
         this.var_1226.label = localeService.getText(name_390.const_975);
         ClanActionsManager.name_1931(this.var_1226);
         this.var_1226.method_1459();
         this.var_1226.addEventListener(MouseEvent.CLICK,this.method_1467);
         addChild(this.var_1226);
         clanService.addEventListener(name_867.CLAN_BLOCK,this.method_1466);
      }
      
      private function method_1466(param1:name_867) : void
      {
         this.description.name_1928(this.clanInfo.method_1449());
      }
      
      private function method_1467(param1:MouseEvent) : void
      {
         new ClanEditProfileDialog(this.clanInfo,this.var_1230,this);
      }
      
      public function method_1468(param1:ClanInfoUpdateEvent) : void
      {
         dispatchEvent(param1);
         this.description.name_1928(param1.name_1929);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.var_1224.y = 11 + ClanTopManagementPanel.const_1532 - 3;
         this.var_1224.width = this.width;
         this.var_1224.height = 120 + 2 * 11;
         this.var_1225.y = this.var_1224.y + this.var_1224.height;
         this.var_1225.width = this.width;
         this.var_1225.height = this.height - this.var_1225.y;
         this.var_1222.x = 11;
         this.var_1222.y = 11;
         this.var_1222.width = this.var_1224.width - 2 * 11;
         this.var_1222.height = 120;
         this.description.x = 11;
         this.description.y = 11;
         this.description.width = this.var_1225.width - 2 * 11;
         this.description.height = this.var_1225.height - 30 - 7 - 2 * 11;
         this.description.onResize();
         this.var_1222.addChild(this.var_1223);
         this.var_1222.addChild(this.var_1228);
         this.var_1222.addChild(this.var_1229);
         this.var_1222.addChild(this.var_1227);
         this.var_1223.x = 11;
         this.var_1228.x = this.var_1223.x + this.var_1223.width + 11;
         this.var_1229.x = this.var_1228.x + this.var_1228.width + 11;
         this.var_1227.x = this.var_1229.x + this.var_1229.width + 11;
         this.var_1223.y = 11;
         this.var_1228.y = this.var_1223.y;
         this.var_1229.y = this.var_1223.y;
         this.var_1227.y = this.var_1223.y;
         this.var_1226.x = 11;
         this.var_1226.y = this._height - this.var_1226.height - 11 - 1;
      }
      
      private function method_1433() : void
      {
         this.var_1223.setValue(clanService.membersCount.toString());
      }
      
      public function name_1875() : void
      {
         this.method_1433();
      }
      
      public function name_1874() : void
      {
         this.method_1433();
      }
      
      public function name_1375(param1:ClanInfoUpdateEvent) : void
      {
         this.var_1230 = param1;
         this.onResize();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.onResize();
      }
   }
}

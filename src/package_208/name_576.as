package package_208
{
   import alternativa.tanks.models.user.name_65;
   import base.class_122;
   import controls.windowinner.WindowInner;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import package_12.name_24;
   import package_209.ClansList;
   import package_209.ClansListEvent;
   import package_209.name_1916;
   import package_25.name_52;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   
   public class name_576 extends class_122
   {
      
      public static var clanUserService:name_65;
      
      public static var clanUserInfoService:name_52;
      
      public static var display:name_24;
      
      public static const const_422:Number = 11;
      
      public static const const_1529:Number = 9;
       
      
      public var var_1258:int = 0;
      
      protected var var_1256:ClansList;
      
      protected var var_1255:WindowInner;
      
      protected var var_1257:int = 30;
      
      private var _width:Number;
      
      private var _height:Number;
      
      public function name_576()
      {
         super();
         this.var_1255 = new WindowInner(0,0,WindowInner.name_1428);
         addChild(this.var_1255);
         this.var_1256 = new ClansList();
         addChild(this.var_1256);
         this.onResize();
      }
      
      protected function onResize(param1:Event = null) : void
      {
         this.var_1255.x = 9;
         this.var_1255.y = 0;
         this.var_1255.width = this.width - 2 * 9;
         this.var_1255.height = this.height - this.var_1257 - 11 - 9;
         this.var_1256.x = this.var_1255.x + 3;
         this.var_1256.y = 3;
         this.var_1256.resize(this.var_1255.width - 6,this.var_1255.height - 4);
      }
      
      protected function onKeyUp(param1:KeyboardEvent) : void
      {
         if(name_1022.name_1834(param1.keyCode))
         {
            param1.stopImmediatePropagation();
            this.method_1320();
         }
      }
      
      protected function method_1320() : void
      {
      }
      
      protected function method_1499(param1:ClansListEvent) : void
      {
         this.var_1256.method_1421(param1.clanId);
      }
      
      protected function method_1498(param1:ClansListEvent) : void
      {
         var _loc2_:String = null;
         if(param1.type.lastIndexOf(ClansListEvent.INCOMING) >= 0)
         {
            _loc2_ = name_1916.INCOMING;
         }
         if(param1.type.lastIndexOf(ClansListEvent.OUTGOING) >= 0)
         {
            _loc2_ = name_1916.OUTGOING;
         }
         this.var_1256.method_1423(param1.clanId,_loc2_);
      }
      
      protected function method_1497(param1:MouseEvent) : void
      {
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
      
      public function destroy() : void
      {
         this.method_1476();
      }
      
      protected function method_1476() : void
      {
      }
   }
}

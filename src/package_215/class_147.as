package package_215
{
   import base.class_122;
   import flash.display.Sprite;
   import flash.events.Event;
   import forms.name_1139;
   import package_13.Long;
   import package_390.name_1889;
   import package_394.name_2045;
   
   public class class_147 extends class_122
   {
      
      protected static const const_422:int = 10;
       
      
      protected var var_1367:name_1889;
      
      protected var var_1370:Sprite;
      
      protected var var_1369:DeleteIndicator;
      
      protected var var_1368:name_2045;
      
      private var _width:Number = 1;
      
      private var _height:Number = 1;
      
      public function class_147()
      {
         super();
      }
      
      protected function onResize(param1:Event = null) : void
      {
      }
      
      protected function method_1595(param1:Long) : Sprite
      {
         var _loc2_:name_2044 = new name_2044();
         this.var_1367 = new name_1889("RTanks",false);
         this.var_1367.x = -3;
         _loc2_.addChild(this.var_1367);
         this.var_1367.name_2046(name_1139.name_1894);
         return _loc2_;
      }
      
      protected function method_1596() : void
      {
         if(this.width <= 0)
         {
            return;
         }
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,this.width,20);
         graphics.endFill();
      }
      
      public function get method_1598() : DeleteIndicator
      {
         return this.var_1369;
      }
      
      public function get method_1597() : name_2045
      {
         return this.var_1368;
      }
      
      public function isSelf() : Boolean
      {
         return this.var_1367.self;
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

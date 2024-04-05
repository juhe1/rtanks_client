package forms.friends
{
   import controls.base.class_196;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import package_461.name_2772;
   
   public class FriendsWindowStateBigButton extends class_196 implements name_2308
   {
      
      private static const const_1547:Class = name_3021;
      
      private static const const_1545:Class = name_3026;
      
      private static const const_1544:Class = name_3025;
      
      private static const const_1546:Class = name_3024;
      
      private static const const_1543:Class = name_3028;
      
      private static const const_1542:Class = name_3020;
      
      private static const const_1540:Class = name_3027;
      
      private static const const_1541:Class = name_3019;
      
      private static const const_1539:Class = name_3022;
      
      private static const const_2289:Class = name_3023;
      
      private static const const_2288:BitmapData = Bitmap(new const_2289()).bitmapData;
      
      private static const const_2290:int = 6;
      
      private static const const_2291:int = 5;
       
      
      public var type:name_2301;
      
      private var var_3003:name_2772;
      
      private var icon:Bitmap;
      
      public function FriendsWindowStateBigButton(param1:name_2301)
      {
         this.var_3003 = new name_2772();
         this.icon = new Bitmap();
         super();
         this.type = param1;
         this.icon.bitmapData = this.method_2801();
         this.icon.x = 6;
         this.icon.y = 5;
         addChild(this.icon);
         _label.align = TextFormatAlign.LEFT;
         _label.autoSize = TextFieldAutoSize.LEFT;
         _label.x = 6 + this.icon.width + 5;
         this.setStyle();
         addChild(this.var_3003);
         this.var_3003.y = -6;
      }
      
      public function set text(param1:String) : void
      {
         _label.text = param1;
      }
      
      private function method_2801() : BitmapData
      {
         switch(this.type)
         {
            case name_2301.name_1669:
               return const_2288;
            default:
               return const_2288;
         }
      }
      
      override public function setStyle(param1:String = "def") : void
      {
         var_1237.name_1933 = new const_1545().bitmapData;
         var_1237.name_1934 = new const_1547().bitmapData;
         var_1237.name_1935 = new const_1544().bitmapData;
         var_1235.name_1933 = new const_1543().bitmapData;
         var_1235.name_1934 = new const_1546().bitmapData;
         var_1235.name_1935 = new const_1542().bitmapData;
         var_1238.name_1933 = new const_1541().bitmapData;
         var_1238.name_1934 = new const_1540().bitmapData;
         var_1238.name_1935 = new const_1539().bitmapData;
         var_1239.name_1933 = new const_1541().bitmapData;
         var_1239.name_1934 = new const_1540().bitmapData;
         var_1239.name_1935 = new const_1539().bitmapData;
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         if(enable)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  this.setState(2);
                  break;
               case MouseEvent.MOUSE_OUT:
                  this.setState(1);
                  break;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(3);
                  break;
               case MouseEvent.MOUSE_UP:
                  this.setState(1);
            }
         }
      }
      
      override protected function setState(param1:int = 0) : void
      {
         switch(param1)
         {
            case 0:
               var_1239.alpha = 1;
               var_1237.alpha = 0;
               var_1235.alpha = 0;
               var_1238.alpha = 0;
               _label.y = 7;
               this.icon.y = 5 + 1;
               break;
            case 1:
               var_1239.alpha = 0;
               var_1237.alpha = 1;
               var_1235.alpha = 0;
               var_1238.alpha = 0;
               _label.y = 6;
               this.icon.y = 5;
               break;
            case 2:
               var_1239.alpha = 0;
               var_1237.alpha = 0;
               var_1235.alpha = 1;
               var_1238.alpha = 0;
               _label.y = 6;
               this.icon.y = 5;
               break;
            case 3:
               var_1239.alpha = 0;
               var_1237.alpha = 0;
               var_1235.alpha = 0;
               var_1238.alpha = 1;
               _label.y = 7;
               this.icon.y = 5 + 1;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.var_3003.x = _width + 3;
      }
      
      override public function get width() : Number
      {
         return _width;
      }
      
      public function method_2802(param1:int, param2:int) : void
      {
         this.var_3003.method_2802(param1,param2);
      }
      
      public function set method_2803(param1:int) : void
      {
         this.var_3003.currentCount = param1;
      }
      
      public function set method_2804(param1:int) : void
      {
         this.var_3003.name_3029 = param1;
      }
      
      public function getType() : name_2301
      {
         return this.type;
      }
   }
}

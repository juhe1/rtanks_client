package alternativa.tanks.gui.clanmanagement
{
   import controls.base.name_1940;
   import flash.events.MouseEvent;
   
   public class ClanStateButton extends name_1940
   {
      
      private static const const_1547:Class = name_1993;
      
      private static const const_1545:Class = name_1996;
      
      private static const const_1544:Class = name_1990;
      
      private static const const_1546:Class = name_1991;
      
      private static const const_1543:Class = name_1994;
      
      private static const const_1542:Class = name_1997;
      
      private static const const_1540:Class = name_1995;
      
      private static const const_1541:Class = name_1992;
      
      private static const const_1539:Class = name_1989;
      
      private static const const_1548:int = 26;
       
      
      public function ClanStateButton()
      {
         super();
         this.init();
      }
      
      private function init() : void
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
               break;
            case 1:
               var_1239.alpha = 0;
               var_1237.alpha = 1;
               var_1235.alpha = 0;
               var_1238.alpha = 0;
               _label.y = 6;
               break;
            case 2:
               var_1239.alpha = 0;
               var_1237.alpha = 0;
               var_1235.alpha = 1;
               var_1238.alpha = 0;
               _label.y = 6;
               break;
            case 3:
               var_1239.alpha = 0;
               var_1237.alpha = 0;
               var_1235.alpha = 0;
               var_1238.alpha = 1;
               _label.y = 7;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:int = Math.ceil(_label.textWidth) + 26;
         if(_loc2_ > param1)
         {
            super.width = _loc2_;
         }
         else
         {
            super.width = param1;
         }
      }
   }
}

package package_254
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class name_2013 extends name_2100
   {
      
      private static var instance:name_2013;
       
      
      public function name_2013()
      {
         super();
         addEventListener(MouseEvent.CLICK,this.method_2555);
      }
      
      public static function name_2019(param1:String, param2:DisplayObject, param3:DisplayObjectContainer) : name_2013
      {
         if(instance == null)
         {
            instance = new name_2013();
         }
         instance.text = param1;
         instance.arrowLehgth = 20;
         instance.arrowAlign = name_2221.BOTTOM_LEFT;
         instance.x = param2.x;
         instance.y = param2.y - 45;
         instance.targetPoint = new Point(param2.x,20);
         instance.draw(instance.size);
         param3.addChild(instance);
         return instance;
      }
      
      public static function hide() : void
      {
         if(instance != null)
         {
            instance.hide();
         }
      }
      
      private function method_2555(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         if(Boolean(parent))
         {
            parent.removeChild(this);
         }
      }
   }
}

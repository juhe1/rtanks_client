package controls.containers
{
   import base.class_122;
   import controls.base.name_2016;
   import flash.display.DisplayObject;
   
   public class StackPanel extends class_122
   {
       
      
      private var var_1750:int;
      
      public var items:Vector.<DisplayObject>;
      
      public function StackPanel()
      {
         this.items = new Vector.<DisplayObject>();
         super();
      }
      
      public function addItem(param1:DisplayObject) : void
      {
         addChild(param1);
         this.items.push(param1);
         this.method_2619(param1);
      }
      
      public function removeItem(param1:DisplayObject) : DisplayObject
      {
         var item:DisplayObject = param1;
         var itemIndex:int = this.items.indexOf(item);
         if(itemIndex < 0)
         {
            return null;
         }
         try
         {
            removeChild(item);
         }
         catch(e:ArgumentError)
         {
            return null;
         }
         this.items.splice(itemIndex,1);
         this.method_2618(itemIndex,item);
         return item;
      }
      
      protected function method_2620(param1:DisplayObject) : int
      {
         return int(param1 is name_2016 ? param1.width - 10 : param1.width);
      }
      
      protected function method_2618(param1:int, param2:DisplayObject) : void
      {
      }
      
      protected function method_2619(param1:DisplayObject) : void
      {
      }
      
      public function method_2622() : int
      {
         return this.var_1750;
      }
      
      public function name_2121(param1:int) : void
      {
         this.var_1750 = param1;
      }
      
      public function method_2621() : int
      {
         return this.items.length;
      }
      
      public function method_2623() : Vector.<DisplayObject>
      {
         return this.items;
      }
   }
}

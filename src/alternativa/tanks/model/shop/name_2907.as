package alternativa.tanks.model.shop
{
   import alternativa.tanks.model.shop.items.kits.class_217;
   import flash.display.Sprite;
   
   public class name_2907 extends Sprite
   {
      
      private static const const_1533:int = 10;
       
      
      public var var_2564:String;
      
      public var var_3429:String;
      
      public var var_3430:String;
      
      public var header:name_3393;
      
      public var items:ShopCategoryViewGrid;
      
      public function name_2907(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2564 = param1;
         this.var_3429 = param2;
         this.var_3430 = param3;
         this.init();
      }
      
      private function init() : void
      {
         this.header = new name_3393(this.var_2564,this.var_3429);
         addChild(this.header);
         this.items = new ShopCategoryViewGrid();
         addChild(this.items);
      }
      
      public function addItem(param1:class_214) : void
      {
         this.items.addItem(param1);
         if(param1 is class_217)
         {
            this.items.columnCount = 1;
         }
      }
      
      public function render(param1:int) : void
      {
         this.header.render(param1);
         this.items.render();
         this.items.y = this.header.y + this.header.height + 10;
      }
      
      public function destroy() : void
      {
         this.header = null;
         this.items.destroy();
         this.items = null;
      }
   }
}

package controls.buttons
{
   import base.class_122;
   import flash.display.Bitmap;
   
   public class name_2257 extends class_122
   {
       
      
      private var left:Bitmap;
      
      private var var_2895:Bitmap;
      
      private var right:Bitmap;
      
      public function name_2257(param1:FixedHeightRectangleSkin)
      {
         super();
         this.left = new Bitmap(param1.left);
         this.var_2895 = new Bitmap(param1.var_2895);
         this.right = new Bitmap(param1.right);
         this.name_1146(param1);
         addChild(this.left);
         addChild(this.right);
         addChild(this.var_2895);
         mouseEnabled = false;
      }
      
      public function name_1146(param1:FixedHeightRectangleSkin) : void
      {
         this.left.bitmapData = param1.left;
         this.var_2895.bitmapData = param1.var_2895;
         this.right.bitmapData = param1.right;
         this.align(width);
      }
      
      override public function set width(param1:Number) : void
      {
         param1 = int(param1);
         this.align(param1);
         super.width = param1;
      }
      
      private function align(param1:int) : void
      {
         this.var_2895.x = this.left.width;
         this.right.x = param1 - this.right.width;
         this.var_2895.width = param1 - this.left.width - this.right.width;
      }
   }
}

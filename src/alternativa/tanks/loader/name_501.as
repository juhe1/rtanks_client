package alternativa.tanks.loader
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class name_501 extends Sprite
   {
       
      
      private var var_985:Sprite;
      
      public function name_501()
      {
         super();
         this.var_985 = new Sprite();
         this.var_985.x = 8;
         this.var_985.y = 9;
         addChild(this.var_985);
      }
      
      public function name_506(param1:DisplayObject) : void
      {
         if(this.var_985.numChildren > 0)
         {
            this.var_985.removeChildAt(0);
         }
         this.var_985.addChild(param1);
      }
   }
}

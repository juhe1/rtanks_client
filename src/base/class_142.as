package base
{
   import flash.display.MovieClip;
   
   public class class_142 extends MovieClip
   {
       
      
      public function class_142()
      {
         super();
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = int(param1);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1);
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = Math.ceil(param1);
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = Math.ceil(param1);
      }
   }
}

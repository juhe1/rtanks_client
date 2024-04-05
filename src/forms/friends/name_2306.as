package forms.friends
{
   import controls.base.name_998;
   
   public class name_2306 extends name_998
   {
      
      private static const const_1548:int = 26;
       
      
      public function name_2306()
      {
         super();
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
      
      override public function get width() : Number
      {
         return _width;
      }
   }
}

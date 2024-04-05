package assets.scroller.color
{
   import assets.scroller.ThumbMiddleRed;
   import assets.scroller.ThumbTopRed;
   import assets.scroller.class_203;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.scroller.color.ScrollThumbSkinRed")]
   public class ScrollThumbSkinRed extends class_203
   {
       
      
      public function ScrollThumbSkinRed()
      {
         super();
      }
      
      override public function method_2888() : void
      {
         var_3129 = new ThumbTopRed(14,1);
         var_3130 = new ThumbMiddleRed(14,1);
      }
   }
}

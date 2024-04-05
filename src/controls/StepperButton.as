package controls
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.StepperButton")]
   public class StepperButton extends MovieClip
   {
       
      
      public function StepperButton()
      {
         super();
         gotoAndStop(1);
      }
   }
}

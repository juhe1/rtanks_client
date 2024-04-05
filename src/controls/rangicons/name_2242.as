package controls.rangicons
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.rangicons.name_2242")]
   public class name_2242 extends RangIcon
   {
       
      
      public var g:MovieClip;
      
      private var var_2883:DisplayObject;
      
      public function name_2242(param1:int = 1)
      {
         addFrameScript(0,this.method_2716);
         super(param1);
         this.var_2883 = getChildByName("g");
         this.var_2883.visible = false;
      }
      
      public function set method_2717(param1:Boolean) : void
      {
         this.var_2883.visible = param1;
      }
      
      internal function method_2716() : *
      {
         stop();
      }
   }
}

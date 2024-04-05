package package_111
{
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   
   public class name_2671 extends ScrollPane
   {
       
      
      private var var_3131:Sprite;
      
      public function name_2671()
      {
         this.var_3131 = new Sprite();
         super();
         this.source = this.var_3131;
         this.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.focusEnabled = false;
         setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         setStyle("trackUpSkin",ScrollTrackGreen);
         setStyle("trackDownSkin",ScrollTrackGreen);
         setStyle("trackOverSkin",ScrollTrackGreen);
         setStyle("trackDisabledSkin",ScrollTrackGreen);
         setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
         this.width = 480;
         this.height = name_1662.const_1994 - 70;
      }
      
      public function addItem(param1:NewsItem) : void
      {
         this.var_3131.addChild(param1);
         this.update();
      }
   }
}

package package_314
{
   import controls.buttons.h50px.class_180;
   import controls.labels.name_2560;
   import controls.timer.CountDownTimer;
   import controls.timer.name_2545;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class name_1361 extends class_180 implements name_2545
   {
       
      
      private var var_2232:name_2560;
      
      private var timer:CountDownTimer;
      
      public function name_1361()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.var_2232 = new name_2560();
         this.var_2232.align = TextFormatAlign.CENTER;
         this.var_2232.autoSize = TextFieldAutoSize.NONE;
         this.var_2232.autoSize = TextFieldAutoSize.NONE;
         this.var_2232.selectable = false;
         this.var_2232.x = 2;
         this.var_2232.y = 25;
         this.var_2232.height = 24;
         this.var_2232.size = 14;
         this.var_2232.mouseEnabled = false;
         this.var_2232.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         addChild(this.var_2232);
         this.var_2232.visible = false;
      }
      
      public function startTimer(param1:CountDownTimer) : void
      {
         enabled = false;
         this.timer = param1;
         if(param1.name_1368() > 0)
         {
            this.const_1647();
            param1.addListener(name_2545,this);
         }
      }
      
      private function const_1647() : void
      {
         this.var_2232.width = int(width) - 4;
         this.var_2232.visible = true;
         this.var_2232.start(this.timer);
         this.resize();
      }
      
      private function resize() : void
      {
         if(this.var_2232.visible)
         {
            _label.y = 8;
         }
         else
         {
            _label.y = 15;
         }
      }
      
      public function name_1363() : void
      {
         if(this.timer != null)
         {
            this.timer.removeListener(name_2545,this);
            this.timer = null;
         }
         this.var_2232.visible = false;
         this.var_2232.stop();
         this.resize();
      }
      
      public function name_2549(param1:CountDownTimer, param2:Boolean) : void
      {
         this.name_1363();
         dispatchEvent(new name_1356(name_1356.name_1364));
      }
   }
}

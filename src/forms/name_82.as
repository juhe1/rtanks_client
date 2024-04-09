package forms
{
   import controls.Label;
   import controls.statassets.name_1154;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_82 extends Sprite
   {
      
      public static const RED:int = 0;
      
      public static const BLUE:int = 1;
       
      
      private const const_151:int = 15;
      
      private var bg:name_1154;
      
      private var label:Label;
      
      private var var_463:int = 0;
      
      private var var_462:Timer;
      
      public function name_82(param1:int, param2:int = 0)
      {
         this.bg = new name_1154();
         this.label = new Label();
         super();
         var _loc3_:name_102 = Main.osgi.getService(name_102) as name_102;
         var _loc4_:String = param2 == 0 ? String(_loc3_.getText(TextConst.BATTLE_TEAM_RED)) : String(_loc3_.getText(TextConst.BATTLE_TEAM_BLUE));
         this.label.align = TextFormatAlign.CENTER;
         this.label.size = 14;
         this.label.bold = true;
         this.label.htmlText = "<font color=" + (param2 == 0 ? "\"#ff9999\">" : "\"#99ccff\">") + _loc3_.getText(TextConst.BATTLE_TEAM_ALERT,_loc4_) + "</font>";
         addChild(this.bg);
         addChild(this.label);
         this.label.x = 15;
         this.label.y = 15;
         this.bg.width = this.label.width + 15 * 2;
         this.bg.height = this.label.height + 15 * 2;
         this.var_463 = param1;
         this.method_686();
         addEventListener(MouseEvent.CLICK,this.hide);
      }
      
      public function hide(param1:Event = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
            removeEventListener(MouseEvent.CLICK,this.hide);
         }
      }
      
      private function method_686() : void
      {
         this.var_462 = new Timer(1000);
         this.var_462.addEventListener(TimerEvent.TIMER,this.method_685);
         this.var_462.start();
         this.method_685();
      }
      
      private function method_685(param1:TimerEvent = null) : void
      {
         --this.var_463;
         if(this.var_463 < 0)
         {
            this.var_462.removeEventListener(TimerEvent.TIMER,this.method_685);
            this.var_462.stop();
            this.hide();
         }
      }
   }
}

package controls.timer
{
   import assets.icons.BattleInfoIcons;
   import controls.labels.name_2560;
   import flash.display.Sprite;
   import flash.events.Event;
   import utils.name_1952;
   
   public class name_3298 extends Sprite
   {
       
      
      private var var_2232:name_2560;
      
      private var icon:BattleInfoIcons;
      
      private var var_3630:int;
      
      public function name_3298(param1:Boolean = true)
      {
         this.var_2232 = new name_2560();
         super();
         this.icon = new BattleInfoIcons();
         this.icon.type = BattleInfoIcons.name_2345;
         addChild(this.icon);
         addChild(this.var_2232);
         if(param1)
         {
            this.var_2232.addEventListener(Event.CHANGE,this.onChange);
         }
         else
         {
            this.var_2232.x = this.icon.width + 3;
         }
      }
      
      private function onChange(param1:Event) : void
      {
         this.align();
      }
      
      private function align() : void
      {
         this.icon.x = this.var_3630 - this.var_2232.width - this.icon.width - 3;
         this.var_2232.x = this.var_3630 - this.var_2232.width;
      }
      
      public function start(param1:CountDownTimer) : void
      {
         this.var_2232.start(param1);
      }
      
      public function stop() : void
      {
         this.var_2232.stop();
      }
      
      public function setTime(param1:int) : void
      {
         this.stop();
         this.var_2232.text = name_1952.format(param1);
         this.align();
      }
      
      public function method_3248(param1:int) : void
      {
         this.var_3630 = param1;
         this.align();
      }
   }
}

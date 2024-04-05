package alternativa.tanks.gui
{
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankInput;
   import controls.name_1922;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class name_2436 extends Sprite
   {
       
      
      private var name_1029:Point;
      
      private const const_1692:int = 11;
      
      private const const_1677:Point = new Point(104,33);
      
      private const const_2319:int = 300;
      
      private var window:name_1922;
      
      private var label:Label;
      
      private var input:TankInput;
      
      private var var_1276:DefaultButton;
      
      public function name_2436()
      {
         super();
         this.window = new name_1922();
         addChild(this.window);
         this.window.width = 300 + 11 * 2;
         this.label = new Label();
         addChild(this.label);
         this.label.bold = true;
         this.label.text = "Please, enter your invite code and keep it:";
         this.label.x = Math.round((this.window.width - this.label.textWidth) * 0.5) - 7;
         this.label.y = 11;
         this.input = new TankInput();
         addChild(this.input);
         this.input.width = 300;
         this.input.x = Math.round((this.window.width - this.input.width) * 0.5) + 5;
         this.input.y = this.label.y + this.label.textHeight + 5;
         this.var_1276 = new DefaultButton();
         addChild(this.var_1276);
         this.var_1276.label = "Ok";
         this.var_1276.x = Math.round((this.window.width - this.const_1677.x) * 0.5);
         this.var_1276.y = this.input.y + this.input.height + 5;
         this.var_1276.addEventListener(MouseEvent.CLICK,this.onOkButtonClick);
         this.window.height = this.var_1276.y + this.const_1677.y + 11;
      }
      
      private function onOkButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function get code() : String
      {
         return this.input.textField.text;
      }
      
      public function name_2460() : void
      {
         this.label.text = "Invite code is not valid";
         this.label.color = 6684672;
         this.label.thickness = 100;
         this.label.sharpness = -100;
         this.label.x = Math.round((this.window.width - this.label.textWidth) * 0.5) - 7;
      }
   }
}

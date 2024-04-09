package juho.hacking.hackmenu {
   import controls.TankCheckBox;
   import controls.TankInput;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import alternativa.tanks.gui.BitmapUpgradeSelectionCenter;
   import alternativa.tanks.gui.BitmapUpgradeSelectionLeft;
   import alternativa.tanks.gui.BitmapUpgradeSelectionRight;
   import controls.Label;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import juho.hacking.Hack;
   import juho.hacking.HackProperty;
   
   public class HackMenuItem extends Sprite {
      
      private static const CONTAINER_COLOR:uint = 0x145998;
      private static const CONTAINER_BORDER_COLOR:uint = 0x00a0F0;
      private static const CONTAINER_BORDER_THICKNESS:int = 3;
      private static const PROPERTY_SPACE:int = 3;
      
      private var hack:Hack;
      private var container:Shape;
      private var checkBox:TankCheckBox;
      private var currentPropertyPos:Point;
      
      public function HackMenuItem(_hack:Hack) {
         this.hack = _hack;
         
         this.container = new Shape()
         addChild(this.container);
         
         var headerBarContainer:Sprite = new Sprite();
         headerBarContainer.x = CONTAINER_BORDER_THICKNESS + 3;
         headerBarContainer.y = CONTAINER_BORDER_THICKNESS + 6;
         addChild(headerBarContainer);
      
         var nameLabel:Label = new Label();
         nameLabel.text = this.hack.name;
         nameLabel.size = 18;
         headerBarContainer.addChild(nameLabel);
         
         var enabledLabel:Label = new Label();
         enabledLabel.text = "ENABLED  ";
         enabledLabel.size = 18;
         enabledLabel.x = nameLabel.x + nameLabel.width + 30;
         headerBarContainer.addChild(enabledLabel);
         
         this.checkBox = new TankCheckBox();
         this.checkBox.x = enabledLabel.x + enabledLabel.width + 5;
         this.checkBox.y = enabledLabel.y - 2;
         this.checkBox.checked = this.hack.isEnabled;
         this.checkBox.addEventListener(MouseEvent.MOUSE_UP, this.enableStateChanged);
         headerBarContainer.addChild(this.checkBox);
         
         currentPropertyPos = new Point(headerBarContainer.x, headerBarContainer.height + headerBarContainer.y + PROPERTY_SPACE)
         
         this.createProperties();
      }
      
      private function enableStateChanged(e:MouseEvent) : void {
         if (this.checkBox.checked) {
            this.hack.enable();
         } else {
            this.hack.disable();
         }
      }
      
      private function createProperties() : void {
         for each (var property:HackProperty in this.hack.allHackProperties) {
            switch (property.type) {
               case "Number":
                  this.createNumberProperty(property);
                  break;
               default:
                  break;
            }
         }
      }
      
      private function createNumberProperty(property:HackProperty) : void {
         var propertyContainer:Sprite = new Sprite();
         propertyContainer.x = this.currentPropertyPos.x + 8;
         propertyContainer.y = this.currentPropertyPos.y;
         addChild(propertyContainer);
         
         var propertyName:Label = new Label();
         propertyName.text = property.name;
         propertyName.size = 18;
         propertyContainer.addChild(propertyName);
         
         var input:TankInput = new TankInput();
         input.width = 200;
         input.x = propertyName.width + 13;
         input.textField.restrict = "0-9";
         input.textField.text = Number(property.value).toString();
         propertyContainer.addChild(input);
         
         currentPropertyPos = new Point(currentPropertyPos.x, propertyContainer.height + propertyContainer.y + PROPERTY_SPACE)
         
         var self:Object = this;
         input.textField.addEventListener(Event.CHANGE, function(event:Event):void {
            self.numberPropertyChanged(property, parseFloat(input.textField.text));
         });
      }
      
      private function numberPropertyChanged(property:HackProperty, value:Number) : void {
         this.hack.setPropertyValue(property.name, value);
      }
      
      public function sizeContainer(_width:int, _height:int) : void {
         this.container.graphics.clear();
         this.container.graphics.beginFill(CONTAINER_BORDER_COLOR);
         this.container.graphics.drawRoundRect(0, 0, _width, _height, 5, 5);
         this.container.graphics.endFill();
         this.container.graphics.beginFill(CONTAINER_COLOR);
         this.container.graphics.drawRoundRect(CONTAINER_BORDER_THICKNESS, CONTAINER_BORDER_THICKNESS, _width - CONTAINER_BORDER_THICKNESS * 2, _height - CONTAINER_BORDER_THICKNESS * 2, 5, 5);
         this.container.graphics.endFill();
      }
   }
}
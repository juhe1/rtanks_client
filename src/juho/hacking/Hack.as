package juho.hacking {
   
   import flash.utils.Dictionary;
   
   public class Hack {
      
      public var name:String = "Unnamed";
      public var isEnabled:Boolean = false;
      public var allHackProperties:Vector.<HackProperty> = new Vector.<HackProperty>();
      
      private var hackPropertiesByName:Dictionary = new Dictionary();
      
      public function Hack() {
         // TODO: load enable state and properties from file
      }
      
      public function enable():void {
         // TODO: save enable state to file
         this.isEnabled = true;
      }
      
      public function disable():void {
         this.isEnabled = false;
      }
      
      public function setPropertyValue(_name:String, value:*):void {
         // TODO: save property to file
         var property:HackProperty = this.hackPropertiesByName[_name];
         property.value = value;
         
         if (property.callBack != null) {
            property.callBack(value);
         }
      }
      
      public function getProperty(name:String):HackProperty {
         var property:HackProperty = this.hackPropertiesByName[name];
         return property;
      }
      
      protected function addProperty(name:String, value:*, type:String, callBack:Function = null):void {
         var property:HackProperty = new HackProperty(name, value, type, callBack);
         this.hackPropertiesByName[name] = property;
         this.allHackProperties.push(property);
      }
   
   }
}
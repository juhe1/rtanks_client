package juho.hacking {
   
   import flash.utils.Dictionary;
   import flash.net.SharedObject;
   
   public class Hack {
      
      public var name:String = "Unnamed";
      public var id:String = "DEFAULT";
      
      public var isEnabled:Boolean = false;
      public var allHackProperties:Vector.<HackProperty> = new Vector.<HackProperty>();
      private var saveData:SharedObject;
      
      private var hackPropertiesByName:Dictionary = new Dictionary();
      
      public function Hack(_name:String, _id:String) {
         this.name = _name;
         this.id = _id;

         this.saveData = SharedObject.getLocal(this.id);
         if (saveData.data.hasOwnProperty("isEnabled")) {
            this.isEnabled = saveData.data.isEnabled;
         }
         
         if (!saveData.data.hasOwnProperty("hackPropertyValuesByName")) {
            saveData.data.hackPropertyValuesByName = new Object();
         }
      }
      
      public function enable():void {
         saveData.data.isEnabled = true;
         this.isEnabled = true;
         saveData.flush();
      }
      
      public function disable():void {
         saveData.data.isEnabled = false;
         this.isEnabled = false;
         saveData.flush();
      }
      
      public function setPropertyValue(_name:String, value:*):void {
         var property:HackProperty = this.hackPropertiesByName[_name];
         property.value = value;
         
         this.saveData.data.hackPropertyValuesByName[_name] = value;
         
         if (property.callBack != null) {
            property.callBack(value);
         }
         saveData.flush();
      }
      
      public function getProperty(_name:String):HackProperty {
         var property:HackProperty = this.hackPropertiesByName[_name];
         return property;
      }
      
      protected function addProperty(_name:String, value:*, _type:String, callBack:Function = null):void {
         var property:HackProperty = new HackProperty(_name, value, _type, callBack);
         this.hackPropertiesByName[_name] = property;
         this.allHackProperties.push(property);
         
         if (saveData.data.hasOwnProperty("hackPropertyValuesByName") && this.saveData.data.hackPropertyValuesByName.hasOwnProperty(_name)) {
            property.value = this.saveData.data.hackPropertyValuesByName[_name];
         }
      }
   
   }
}
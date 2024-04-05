package package_115
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class class_59
   {
       
      
      private var var_933:String;
      
      private var var_938:int;
      
      private var _image:ImageResource;
      
      private var _prizes:Vector.<name_329>;
      
      private var var_274:int;
      
      private var var_939:String;
      
      public function class_59(param1:String = null, param2:int = 0, param3:ImageResource = null, param4:Vector.<name_329> = null, param5:int = 0, param6:String = null)
      {
         super();
         this.var_933 = param1;
         this.var_938 = param2;
         this._image = param3;
         this._prizes = param4;
         this.var_274 = param5;
         this.var_939 = param6;
      }
      
      public function get description() : String
      {
         return this.var_933;
      }
      
      public function set description(param1:String) : void
      {
         this.var_933 = param1;
      }
      
      public function get finishCriteria() : int
      {
         return this.var_938;
      }
      
      public function set finishCriteria(param1:int) : void
      {
         this.var_938 = param1;
      }
      
      public function get image() : ImageResource
      {
         return this._image;
      }
      
      public function set image(param1:ImageResource) : void
      {
         this._image = param1;
      }
      
      public function get prizes() : Vector.<name_329>
      {
         return this._prizes;
      }
      
      public function set prizes(param1:Vector.<name_329>) : void
      {
         this._prizes = param1;
      }
      
      public function get progress() : int
      {
         return this.var_274;
      }
      
      public function set progress(param1:int) : void
      {
         this.var_274 = param1;
      }
      
      public function get questId() : String
      {
         return this.var_939;
      }
      
      public function set questId(param1:String) : void
      {
         this.var_939 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "CommonQuestInfo [";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "finishCriteria = " + this.finishCriteria + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "prizes = " + this.prizes + " ";
         _loc1_ += "progress = " + this.progress + " ";
         _loc1_ += "questId = " + this.questId + " ";
         return _loc1_ + "]";
      }
   }
}

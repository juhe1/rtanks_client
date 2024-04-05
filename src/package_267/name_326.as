package package_267
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.dailyquest.name_2832;
   
   public class name_326
   {
       
      
      private var var_941:Boolean;
      
      private var var_933:String;
      
      private var var_938:int;
      
      private var _image:ImageResource;
      
      private var _prizes:Vector.<name_2832>;
      
      private var var_274:int;
      
      private var var_939:String;
      
      private var var_942:int;
      
      public function name_326(param1:Boolean = false, param2:String = null, param3:int = 0, param4:ImageResource = null, param5:Vector.<name_2832> = null, param6:int = 0, param7:String = null, param8:int = 0)
      {
         super();
         this.var_941 = param1;
         this.var_933 = param2;
         this.var_938 = param3;
         this._image = param4;
         this._prizes = param5;
         this.var_274 = param6;
         this.var_939 = param7;
         this.var_942 = param8;
      }
      
      public function get canSkipForFree() : Boolean
      {
         return this.var_941;
      }
      
      public function set canSkipForFree(param1:Boolean) : void
      {
         this.var_941 = param1;
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
      
      public function get prizes() : Vector.<name_2832>
      {
         return this._prizes;
      }
      
      public function set prizes(param1:Vector.<name_2832>) : void
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
      
      public function get skipCost() : int
      {
         return this.var_942;
      }
      
      public function set skipCost(param1:int) : void
      {
         this.var_942 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DailyQuestInfo [";
         _loc1_ += "canSkipForFree = " + this.canSkipForFree + " ";
         _loc1_ += "description = " + this.description + " ";
         _loc1_ += "finishCriteria = " + this.finishCriteria + " ";
         _loc1_ += "image = " + this.image + " ";
         _loc1_ += "prizes = " + this.prizes + " ";
         _loc1_ += "progress = " + this.progress + " ";
         _loc1_ += "questId = " + this.questId + " ";
         _loc1_ += "skipCost = " + this.skipCost + " ";
         return _loc1_ + "]";
      }
   }
}

package platform.client.core.general.resource.types.imageframe
{
   public class ResourceImageFrameParams
   {
       
      
      private var _fps:Number;
      
      private var _frameHeight:int;
      
      private var _frameWidth:int;
      
      private var _numFrames:int;
      
      public function ResourceImageFrameParams(param1:Number = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this._fps = param1;
         this._frameHeight = param2;
         this._frameWidth = param3;
         this._numFrames = param4;
      }
      
      public function get fps() : Number
      {
         return this._fps;
      }
      
      public function set fps(param1:Number) : void
      {
         this._fps = param1;
      }
      
      public function get frameHeight() : int
      {
         return this._frameHeight;
      }
      
      public function set frameHeight(param1:int) : void
      {
         this._frameHeight = param1;
      }
      
      public function get frameWidth() : int
      {
         return this._frameWidth;
      }
      
      public function set frameWidth(param1:int) : void
      {
         this._frameWidth = param1;
      }
      
      public function get numFrames() : int
      {
         return this._numFrames;
      }
      
      public function set numFrames(param1:int) : void
      {
         this._numFrames = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ResourceImageFrameParams [";
         _loc1_ += "fps = " + this.fps + " ";
         _loc1_ += "frameHeight = " + this.frameHeight + " ";
         _loc1_ += "frameWidth = " + this.frameWidth + " ";
         _loc1_ += "numFrames = " + this.numFrames + " ";
         return _loc1_ + "]";
      }
   }
}

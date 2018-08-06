<!-- G4TrackingManager.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 07:04:33 2018 (+0800)
;; Last-Updated: 二 8月  7 07:05:46 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4TrackingManager

This is an interface class among the event,  the track and the tracking category. It handles necessary message passings between the upper hierarchical object, which is the event manager (G4EventManager), and lower hierarchical objects in the tracking category. It receives one track in an event from the event manager and takes care to finish tracking it. 

**Geant4 kernel use only.**

## class

```cpp
//--------
public: // without description
//--------

// Constructor/Destructor

   G4TrackingManager();
      // TrackingManger should be dynamic persistent, therefore you
      // need to invoke new() when you call this constructor.
      // "G4SteppingManger' and "G4UserTrackingAction" will be 
      // constructed in this constructor. "This" pointer will be
      // passed to "G4UserTrackingAction". 

   ~G4TrackingManager();

// Get/Set functions

   G4Track* GetTrack() const;

   G4int GetStoreTrajectory() const;
   void SetStoreTrajectory(G4int value);

   G4SteppingManager* GetSteppingManager() const;

   G4UserTrackingAction* GetUserTrackingAction() const;

   G4VTrajectory* GimmeTrajectory() const;
   void SetTrajectory(G4VTrajectory* aTrajectory);
    
   G4TrackVector* GimmeSecondaries() const;

  //   void SetNavigator(G4Navigator* apValue);

   void SetUserAction(G4UserTrackingAction* apAction);
   void SetUserAction(G4UserSteppingAction* apAction);

   void SetVerboseLevel(G4int vLevel);
   G4int GetVerboseLevel() const;


// Other member functions

   void ProcessOneTrack(G4Track* apValueG4Track);
      // Invoking this function, a G4Track given by the argument
      // will be tracked.  

   void EventAborted();
      // Invoking this function, the current tracking will be
      // aborted immediately. The tracking will return the 
      // G4TrackStatus in 'fUserKillTrackAndSecondaries'.
      // By this the EventManager deletes the current track and all 
      // its accoicated csecondaries.

   void SetUserTrackInformation(G4VUserTrackInformation* aValue);
      // This method can be invoked from the user's G4UserTrackingAction
      // implementation to set his/her own G4VUserTrackInformation concrete
      // class object to a G4Track object.

//---------
   private:
//---------

// Member data

   G4Track* fpTrack;
   G4SteppingManager* fpSteppingManager;
   G4UserTrackingAction* fpUserTrackingAction;
   G4VTrajectory* fpTrajectory;
   G4int StoreTrajectory;
   G4int verboseLevel;
   G4TrackingMessenger* messenger;
   G4bool EventIsAborted;
// verbose
   void TrackBanner();
```

<!-- G4TrackingManager.md ends here -->

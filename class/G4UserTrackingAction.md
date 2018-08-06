<!-- G4UserTrackingAction.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 07:01:02 2018 (+0800)
;; Last-Updated: 二 8月  7 07:01:39 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4UserTrackingAction

This class represents actions taken place by the user at the start/end point of processing one track. 

## class

```cpp
//--------
public: // with description
//--------

// Constructor & Destructor
   G4UserTrackingAction();
   virtual ~G4UserTrackingAction();

// Member functions
   virtual void SetTrackingManagerPointer(G4TrackingManager* pValue);
   virtual void PreUserTrackingAction(const G4Track*){;}
   virtual void PostUserTrackingAction(const G4Track*){;}

//----------- 
   protected:
//----------- 

// Member data
   G4TrackingManager* fpTrackingManager;
```

<!-- G4UserTrackingAction.md ends here -->

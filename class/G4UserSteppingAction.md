<!-- G4UserSteppingAction.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 06:59:14 2018 (+0800)
;; Last-Updated: 二 8月  7 06:59:59 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4UserSteppingAction

This class represents actions taken place by the user at each end of stepping.



## class

```cpp
//--------
public: // with description
//--------

// Constructor and destructors
   G4UserSteppingAction();
   virtual ~G4UserSteppingAction();

// Member functions
   virtual void SetSteppingManagerPointer(G4SteppingManager* pValue);
   virtual void UserSteppingAction(const G4Step*){;}

//-----------
   protected:
//-----------

// Member data
   G4SteppingManager* fpSteppingManager;
```

<!-- G4UserSteppingAction.md ends here -->

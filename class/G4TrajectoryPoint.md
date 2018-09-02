<!-- G4TrajectoryPoint.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 12:52:15 2018 (+0800)
;; Last-Updated: 日 9月  2 12:53:36 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4TrajectoryPoint

**public G4VTrajectoryPoint**

This class represents the trajectory of a particle tracked.  
It includes information of 
- 1) List of trajectory points which compose the trajectory,
- 2) static information of particle which generated the trajectory, 
- 3) trackID and parent particle ID of the trajectory,
- 4) termination condition of the trajectory.


## class

```cpp
//--------
public: // without description
//--------

// Constructor/Destructor
   G4TrajectoryPoint();
   G4TrajectoryPoint(G4ThreeVector pos);
   G4TrajectoryPoint(const G4TrajectoryPoint &right);
   virtual ~G4TrajectoryPoint();

// Operators
   inline void *operator new(size_t);
   inline void operator delete(void *aTrajectoryPoint);
   inline int operator==(const G4TrajectoryPoint& right) const
   { return (this==&right); };

// Get/Set functions
   inline const G4ThreeVector GetPosition() const
   { return fPosition; };

// Get method for HEPRep style attributes
   virtual const std::map<G4String,G4AttDef>* GetAttDefs() const;
   virtual std::vector<G4AttValue>* CreateAttValues() const;

//---------
   private:
//---------

// Member data
   G4ThreeVector fPosition;
```

<!-- G4TrajectoryPoint.md ends here -->

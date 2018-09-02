<!-- G4VTrajectoryPoint.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 12:51:07 2018 (+0800)
;; Last-Updated: 日 9月  2 12:51:48 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VTrajectoryPoint

This class is the abstract base class which represents the point which consists of a trajectory.  
It includes information of a the point.

## class

```cpp
 public: // with description

 // Constructor/Destructor
   G4VTrajectoryPoint();
   virtual ~G4VTrajectoryPoint();

 // Operators
   G4bool operator==(const G4VTrajectoryPoint& right) const;

 // Get/Set functions
   virtual const G4ThreeVector GetPosition() const = 0;

 // Get method for a vector of auxiliary points
   virtual const std::vector<G4ThreeVector>* GetAuxiliaryPoints() const
   { return 0; }
   // If implemented by a derived class, returns a pointer to a list
   // of auxiliary points, e.g., intermediate points used during the
   // calculation of the step that can be used for drawing a smoother
   // trajectory.  The user must test the validity of this pointer.

 // Get method for HEPRep style attribute definitions
   virtual const std::map<G4String,G4AttDef>* GetAttDefs() const
   { return 0; }
   // If implemented by a derived class, returns a pointer to a map of
   // attribute definitions for the attribute values below.  The user
   // must test the validity of this pointer.  See G4Trajectory for an
   // example of a concrete implementation of this method.

 // Get method for HEPRep style attribute values
   virtual std::vector<G4AttValue>* CreateAttValues() const
   { return 0; }
   // If implemented by a derived class, returns a pointer to a list
   // of attribute values suitable, e.g., for picking.  Each must
   // refer to an attribute definition in the above map; its name is
   // the key.  The user must test the validity of this pointer (it
   // must be non-zero and conform to the G4AttDefs, which may be
   // checked with G4AttCheck) and delete the list after use.  See
   // G4Trajectory for an example of a concrete implementation of this
   // method and G4VTrajectory::ShowTrajectory for an example of its
   // use.
```

<!-- G4VTrajectoryPoint.md ends here -->

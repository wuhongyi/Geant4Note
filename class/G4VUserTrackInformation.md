<!-- G4VUserTrackInformation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 08:28:18 2018 (+0800)
;; Last-Updated: 五 8月 10 08:28:56 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VUserTrackInformation

```cpp
//  Abstract class which the user can derive his/her own concrete
// class for toring user's information associating with a G4Track
// class object.
//
//  It is user's responsibility 
//   1) Construct a concrete class object and set the pointer to
//     proper G4Track object
//   2) Concrete class derived from this class is expected to use G4Allocator
//     for memory management or something equivarent for performance reason
//
//  To set a pointer of a concrete class object to G4Track in
// G4UserTrackingAction concrete implementation, given the G4Track
// object is available only by "pointer to const", SetUserTrackInformation()
// method of G4TrackingManager is available.
//
//  The concrete class object is deleted by Geant4 kernel when
// associated G4Track object is deleted.
```

## class

```cpp
  public: // With Description
    G4VUserTrackInformation();
    G4VUserTrackInformation(const G4String& infoType);
    // String is provided to indicate Type of UserTrackInfo class  
    // User is recommended to set the type of his/her class  

    G4VUserTrackInformation(const  G4VUserTrackInformation&);
    G4VUserTrackInformation& operator=(const G4VUserTrackInformation&);
  

    virtual ~G4VUserTrackInformation();

    virtual void Print() const {};
    
    const G4String& GetType() const;
    // get Type of this UserTrackInfo     
 
  protected:
    G4String* pType;    
```

<!-- G4VUserTrackInformation.md ends here -->

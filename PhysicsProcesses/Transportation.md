<!-- Transportation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 12月 23 22:20:24 2017 (+0800)
;; Last-Updated: 一 5月 21 08:48:44 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# Transportation

> http://geant4-userdoc.web.cern.ch/geant4-userdoc/UsersGuides/ForApplicationDeveloper/html/TrackingAndPhysics/physicsProcess.html#transportation-process

A Transportation process is required for every particle which is tracked in a simulation. It interfaces with the Geometry Modeller, to move a track inside the geometry by calling the G4Navigator class. In addition, if an external field (potentially Electromagnetic, but also gravity or a combination) is registered for the whole setup or inside the current volume, it calls the class (G4PropagatorInField) which integrates the equation of motion, and then intersects the curved trajectory with the geometry.

Transportation comes in two flavours:

- the ‘standard’ **G4Transportation** process, used for most applications, and
- the **G4CoupledTransportation** process, which is activated when multiple geometries are active.

Multiple geometries can be created in order to cope with different use cases:

- when a mass overlay geometry is used to overlap a set of ‘top’ volume onto a complex existing geometry,
- when the Geant4 scoring and/or biasing capabilities are activated.


The registration of the relevant Transportation process is handled by the **G4RunManager**, which chooses the correct type depending on whether any of the features which require parallel geometries have been used.

The **G4Transportation** process uses the **G4Navigator** of the Geant4 Geometry Modeller to obtain the distance to the next boundary along a straight line (for a neutral particle, or a charged particle in zero field.)

The **G4CoupledTransportation** process uses the **G4PathFinder** class to obtain the shortest length to a boundary amongst the geometries registered for the current particle - in effect multiplexing the different geometries.

In addition the transportation processes estimates the time of flight for the current step. For a neutral particle or a charged particle inside a pure magnetic field, this is estimated from the initial and final velocity of the particle. This taking into account roughly the effect of energy loss from ionisation. Since the full path length is used (rather than the geometrical one) the path lengthening due to multiple scattering is also taken into account.

For a charged particle in an EM field with a non-zero electric component, or a gravity field, the time of flight is calculated taking into account the change in velocity.






<!-- Transportation.md ends here -->

// Main rail variables:

/* Small horizontal planes at the top and bottom of the main rails. Used so we can fasten the rail to the frame
   Note that this value is also used for a depression at the bottom/top of the frame for aligning the rail */
railFootThickness = 3;

railTotalHeight = screwDiff * (numRailScrews + 1) + 2 * railFootThickness;

railFrontThickness = 6; // Make sure that the nuts for the chosen screw type can slot within the front face
railSideMountThickness = 2.5;

// Distance between the middle of a screw mount and the rail's vertical edges
railScrewHoleToInnerEdge = 5;
railScrewHoleToOuterEdge = 7;

// Distance between the midpoint of the rail screw holes.
rackMountScrewWidth = maxUnitWidth + 2 * railScrewHoleToInnerEdge;

// Extra spacing for screws.
frontScrewSpacing = 15;

sideSupportScrewHoleToBackEdge = 4;
sideSupportDepth = sideSupportScrewHoleToBackEdge + frontScrewSpacing;

frontFaceWidth = railScrewHoleToInnerEdge + railScrewHoleToOuterEdge;

railTotalWidth = frontFaceWidth;
railTotalDepth = railFrontThickness+sideSupportDepth;


// Side Wall variables:
sideWallThickness = 2.5;

sideWallSlotToOuterYEdge = 3;
sideWallSlotToOuterXEdge = 3; // TODO rename to variables found in ybar;
sideWallConnectorSlotWidth = 7;


// Y Bar variables:
railSlotToXZ = 3;
sideWallSlotToXZ = 3;

railSlotToInnerYEdge = 2;
railSlotToSideWallSlot = 2;

yBarWidth = railSlotToInnerYEdge + railTotalWidth+ railSlotToSideWallSlot
  + sideWallSlotToOuterYEdge + sideWallConnectorSlotWidth;
yBarDepth = maxUnitDepth + 2*railSlotToInnerYEdge;
yBarHeight = 15;
yBarWallThickness = 3;
yBarRoundness = baseRoundness;

joinCornerDepth = 32;
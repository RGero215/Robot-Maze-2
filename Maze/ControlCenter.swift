//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
    // You may want to paste your Part 2 implementation of moveComplexRobot() here
        
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        
        let myWallInfo = checkWalls(myRobot)
        
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPathJunction = (myWallInfo.numberOfWalls == 2)
        let isDeadEndJunction = (myWallInfo.numberOfWalls == 3)
        
        print(isThreeWayJunction)
        print(isTwoWayPathJunction)
        print(isDeadEndJunction)
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
        }
        
        if isTwoWayPathJunction && !robotIsBlocked {
            myRobot.move()
        } else if isTwoWayPathJunction && robotIsBlocked {
            turnTowardClearPath(myRobot, wallInfo: myWallInfo)
        }
        
        if isDeadEndJunction {
            if robotIsBlocked {
                myRobot.rotateRight()
            } else {
                myRobot.move()
            }
        }

        
        // Step 3.2
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}

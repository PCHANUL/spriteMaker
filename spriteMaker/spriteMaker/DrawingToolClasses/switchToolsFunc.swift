//
//  switchTouchesFunc.swift
//  spriteMaker
//
//  Created by 박찬울 on 2021/04/20.
//

import UIKit

extension Canvas {
    func switchToolsNoneTouches(_ context: CGContext) {
        guard let selectedLayer = panelVC.layerVM.selectedLayer else { return }
        if (!selectedLayer.ishidden) {
            switch selectedDrawingMode {
            case "pen":
                print("pen")
            case "touch":
                switch panelVC.drawingToolVM.selectedTool.name {
                case "Pencil":
                    pencilTool.noneTouches(context)
                default:
                    break
                }
                touchDrawingMode.noneTouches(context)
            default:
                return
            }
        }
    }
    
    func switchToolsTouchesBegan(_ pixelPosition: [String: Int]) {
        guard let selectedLayer = panelVC.layerVM.selectedLayer else { return }
        if (selectedDrawingMode == "touch") {
            touchDrawingMode.touchesBegan(pixelPosition)
        }
        if (!selectedLayer.ishidden) {
            switch panelVC.drawingToolVM.selectedTool.name {
            case "Paint":
                paintTool.touchesBegan(pixelPosition)
            case "Magic":
                magicTool.touchesBegan(pixelPosition)
            case "SelectSquare":
                selectSquareTool.touchesBegan(pixelPosition)
            case "Line":
                lineTool.touchesBegan(pixelPosition)
            case "Square":
                squareTool.touchesBegan(pixelPosition)
            case "Eraser":
                eraserTool.touchesBegan(pixelPosition)
            case "Picker":
                pickerTool.touchesBegan(pixelPosition)
            default: break
            }
        }
        if (!activatedDrawing) {
            activatedToogle = false
        }
    }
    
    func switchToolsTouchesBeganOnDraw(_ context: CGContext) {
        guard let selectedLayer = panelVC.layerVM.selectedLayer else { return }
        if (!selectedLayer.ishidden) {
            switch panelVC.drawingToolVM.selectedTool.name {
            case "Paint":
                paintTool.touchesBeganOnDraw(context)
            case "Magic":
                magicTool.touchesBeganOnDraw(context)
            case "SelectSquare":
                selectSquareTool.touchesBeganOnDraw(context)
            case "Line":
                lineTool.touchesBeganOnDraw(context)
            case "Pencil":
                pencilTool.touchesBeganOnDraw(context)
            case "Picker":
                pickerTool.touchesBeganOnDraw(context)
            default: break
            }
        }
        if (selectedDrawingMode == "touch") {
            touchDrawingMode.touchesBeganOnDraw(context)
        }
        if (!activatedDrawing) {
            activatedToogle = false
        }
    }
    
    func switchToolsTouchesMoved(_ context: CGContext) {
        switch panelVC.drawingToolVM.selectedTool.name {
        case "Paint":
            paintTool.touchesMoved(context)
        case "Magic":
            magicTool.touchesMoved(context)
        case "SelectSquare":
            selectSquareTool.touchesMoved(context)
        case "Line":
            lineTool.touchesMoved(context)
        case "Square":
            squareTool.touchesMoved(context)
        case "Eraser":
            eraserTool.touchesMoved(context)
        case "Pencil":
            pencilTool.touchesMoved(context)
        case "Picker":
            pickerTool.touchesMoved(context)
        default: break
        }
        if (selectedDrawingMode == "touch") {
            touchDrawingMode.touchesMoved(context)
        }
        if (!activatedDrawing) {
            activatedToogle = false
        }
    }
    
    func switchToolsTouchesEnded(_ context: CGContext) {
        if (selectedDrawingMode == "touch") {
            touchDrawingMode.touchesEnded(context)
        }
        switch panelVC.drawingToolVM.selectedTool.name {
        case "Paint":
            paintTool.touchesEnded(context)
        case "Magic":
            magicTool.touchesEnded(context)
        case "SelectSquare":
            selectSquareTool.touchesEnded(context)
        case "Line":
            lineTool.touchesEnded(context)
        case "Square":
            squareTool.touchesEnded(context)
        case "Picker":
            pickerTool.touchesEnded(context)
        case "Pencil":
            pencilTool.touchesEnded(context)
        case "Eraser":
            eraserTool.touchesEnded(context)
        default: break
        }
        if (!activatedDrawing) {
            activatedToogle = false
        }
    }
    
    func switchToolsButtonDown() {
        switch panelVC.drawingToolVM.selectedTool.name {
        case "SelectSquare":
            selectSquareTool.buttonDown()
        default:
            return
        }
    }
    
    func switchToolsButtonUp() {
        switch panelVC.drawingToolVM.selectedTool.name {
        case "SelectSquare":
            selectSquareTool.buttonUp()
        default:
            return
        }
    }
}


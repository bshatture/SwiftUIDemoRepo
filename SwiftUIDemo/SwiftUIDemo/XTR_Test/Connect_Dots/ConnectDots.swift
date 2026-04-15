//
//  ConnectDots.swift
//  SwiftUIDemo
//
//  Created by Bhimashankar Hatture on 28/03/26.
//
import SwiftUI

enum Player {
    case red, yellow
}

struct ConnectDotsView: View {
    static let rows = 6
    static let cols = 7

    @State private var grid: [[Player?]] = Array(
        repeating: Array(repeating: nil, count: cols),
        count: Self.rows
    )
    @State private var currentPlayer: Player = .red
    @State private var winner: Player? = nil
    @State private var isDraw: Bool = false

    let columnsLayout = Array(repeating: GridItem(.flexible()), count: cols)

    var body: some View {
        VStack(spacing: 16) {

            // Turn / result indicator
            HStack(spacing: 8) {
                Circle()
                    .fill(indicatorColor)
                    .frame(width: 18, height: 18)
                Text(statusText)
                    .font(.headline)
            }
            .padding(.top)

            // Drop buttons row
            HStack(spacing: 0) {
                ForEach(0..<Self.cols, id: \.self) { col in
                    Button("↓") {
                        dropPiece(in: col)
                    }
                    .frame(maxWidth: .infinity)
                    .disabled(winner != nil || isDraw)
                }
            }

            // Blue board with circles
            VStack(spacing: 8) {
                ForEach(0..<Self.rows, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(0..<Self.cols, id: \.self) { col in
                            Circle()
                                .fill(circleColor(row: row, col: col))
                                .frame(width: 44, height: 44)
                        }
                    }
                }
            }
            .padding(12)
            .cornerRadius(12)

            // Play Again button
            if winner != nil || isDraw {
                Button("Play Again") {
                    resetGame()
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Computed

    var statusText: String {
        if let w = winner {
            return w == .red ? "Red wins!" : "Yellow wins!"
        }
        if isDraw { return "It's a draw!" }
        return currentPlayer == .red ? "Red's turn" : "Yellow's turn"
    }

    var indicatorColor: Color {
        if let w = winner { return w == .red ? .red : .yellow }
        return currentPlayer == .red ? .red : .yellow
    }

    func circleColor(row: Int, col: Int) -> Color {
        switch grid[row][col] {
        case .red:    return .red
        case .yellow: return .yellow
        case .none:   return .blue
        }
    }

    // MARK: - Game Logic

    func dropPiece(in col: Int) {
        guard winner == nil, !isDraw else { return }
        for row in (0..<Self.rows).reversed() {
            if grid[row][col] == nil {
                grid[row][col] = currentPlayer
                if checkWin(player: currentPlayer) {
                    winner = currentPlayer
                } else if checkDraw() {
                    isDraw = true
                } else {
                    currentPlayer = currentPlayer == .red ? .yellow : .red
                }
                return
            }
        }
    }

    func resetGame() {
        grid = Array(
            repeating: Array(repeating: nil, count: Self.cols),
            count: Self.rows
        )
        currentPlayer = .red
        winner = nil
        isDraw = false
    }

    func checkWin(player: Player) -> Bool {
        checkHorizontal(player: player) ||
        checkVertical(player: player) ||
        checkDiagonal(player: player)
    }

    func checkHorizontal(player: Player) -> Bool {
        for r in 0..<Self.rows {
            var count = 0
            for c in 0..<Self.cols {
                count = grid[r][c] == player ? count + 1 : 0
                if count == 4 { return true }
            }
        }
        return false
    }

    func checkVertical(player: Player) -> Bool {
        for c in 0..<Self.cols {
            var count = 0
            for r in 0..<Self.rows {
                count = grid[r][c] == player ? count + 1 : 0
                if count == 4 { return true }
            }
        }
        return false
    }

    func checkDiagonal(player: Player) -> Bool {
        // Down-right ↘
        for r in 0...(Self.rows - 4) {
            for c in 0...(Self.cols - 4) {
                if (0..<4).allSatisfy({ grid[r + $0][c + $0] == player }) {
                    return true
                }
            }
        }
        // Down-left ↙
        for r in 0...(Self.rows - 4) {
            for c in 3..<Self.cols {
                if (0..<4).allSatisfy({ grid[r + $0][c - $0] == player }) {
                    return true
                }
            }
        }
        return false
    }

    func checkDraw() -> Bool {
        grid.allSatisfy { $0.allSatisfy { $0 != nil } }
    }
}

#Preview {
    ConnectDotsView()
}

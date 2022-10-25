# Sebastian Torrejon Alonzo

require 'spec_helper'

describe 'C4 standard board size' do
    it 'detects P1 winning horizontally' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('aabbccdq')
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning horizontally' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('aabbccededq')
        expect(result).to declare_win_for 2
    end
    it 'detects P1 winning vertically' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abababaq')
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning vertically' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('ababaacbcbq')
        expect(result).to declare_win_for 2
    end
    it 'detects P1 winning diagonal-left' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abbcdccddedq')
        expect(result).to declare_win_for 1
    end
    it 'detects P1 winning diagonal-right' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('dccbbabaacaq')
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning diagonal-left' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('bacbccddddq')
        expect(result).to declare_win_for 2
    end
    it 'detects P2 winning diagonal-right' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('cdbcbbaaaaq')
        expect(result).to declare_win_for 2
    end


    # zk  The purpose of these types of tests is to make sure that
    # the win-detection algorithm doesn't incorrectly detect a win
    # too early.  You may want more such tests.
    it 'quits before declaring a winner' do
        result = test_c4('abababq')
        expect(result).to be_abandoned
    end
end

describe 'Connect 4 alternate' do
    it 'detects P1 winning horizontally on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('aabq', 7, 8, 2)
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning horizontally on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abbccdq', 8, 8, 3)
        expect(result).to declare_win_for 2
    end
    it 'detects P1 winning vertically on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abababaq',9,8,4)
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning vertically on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('ababababcbq',9,9,5)
        expect(result).to declare_win_for 2
    end
    it 'detects P1 winning diagonal-left on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abbcdccddedeeeeffffffq',9,10,6)
        expect(result).to declare_win_for 1
    end
    it 'detects P1 winning diagonal-right on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('gffeededdcdccccbbbbbbaaaaaahaq',10,10,7)
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning diagonal-left on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('bacbccddddeeeefeffffgfgggggghhhhhhhhq', 11,10,8)
        expect(result).to declare_win_for 2
    end
    it 'detects P2 winning diagonal-right on a bigger board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('hikhggfgffefeeeeddddddccccccbcbbbbbbabaaaaaaaaq',11,11,9)
        expect(result).to declare_win_for 2
    end
    it 'quits before declaring a winner on a bigger board' do
        result = test_c4('abcdefgabcdefgabcdefgq',12,11,10)
        expect(result).to be_abandoned
    end
    it 'detects P1 winning horizontally on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('aabq', 2,2,2)
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning horizontally on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abdcq',2,4,2)
        expect(result).to declare_win_for 2
    end
    it 'detects P1 winning vertically on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('ababaq',5,6,3)
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning vertically on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abababcbq',4,6,4)
        expect(result).to declare_win_for 2
    end
    it 'detects P1 winning diagonal-left on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abbq',2,2,2)
        expect(result).to declare_win_for 1
    end
    it 'detects P1 winning diagonal-right on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('babq',3,6,2)
        expect(result).to declare_win_for 1
    end
    it 'detects P2 winning diagonal-left on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('bacbccq',5,3,3)
        expect(result).to declare_win_for 2
    end
    it 'detects P2 winning diagonal-right on a smaller board' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('abcaq',3,4,2)
        expect(result).to declare_win_for 2
    end
    it 'quits before declaring a winner on a smaller board' do
        result = test_c4('abababq', 4, 5, 4)
        expect(result).to be_abandoned
    end
end
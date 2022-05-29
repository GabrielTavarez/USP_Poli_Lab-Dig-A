TOG_EN, CLK, CLRL: in
Z1: out

PS, NS : state_type (ST0, ST1)

process
    if (CLR = 1)
        {PS = ST0}
    if (rising_edge(CLK))
        {PS = NS}
end process

process 
    Z1 = 0
    if (PS = ST0)
        {Z1 = 0
        if (TOG_EN = 1)
            {NS = ST1}
        else
            {NS = ST0}
        }
    if (PS = ST1)
        {Z1 = 1
        if (TOG_EN = 1)
            {NS = ST0}
        else   
            {NS = ST1}
        }
    else {
        Z1 = 0
        NS = ST0
    }
end process

// The 'tashina_j_token' program.
program tashina_j_token.aleo {
    record Token {
        owner: address,
        amount: u64,
    }
    transition mint(amount: u64) -> Token {
        return Token {
            owner: self.caller,
            amount: amount,
        };
    }
    transition transfer(token: Token, to: address, amount: u64) -> (Token, Token) {
        let difference: u64 = token.amount - amount;
        let remaining: Token = Token {
            owner: token.owner,
            amount: difference,
        };
        let transferred: Token = Token {
            owner: to,
            amount: amount,
        };
        return (remaining, transferred);
    }
    transition balance_of(owner_balance: Token) -> u64 {
        let amount_balance: u64 = owner_balance.amount;
        let minimun: u64 = 0u64;
        let return_balance:u64 = 0u64;
        if amount_balance >= minimun{
            return_balance = amount_balance;
        }
        return return_balance;
    }
}
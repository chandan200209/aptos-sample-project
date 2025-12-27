module SendMessage::sendMessage {
    // each smart contract is a module

    // use keyword is used for importing
    use std::string::{String, utf8};
    use std::signer;
    use aptos_framework::account;

    // Creating resources
    struct Message has key {
        my_message: String,
    }
    // creating instructions for the resources
    public entry fun store_message(account: &signer, msg: String) acquires Message{
        let signer_address = signer::address_of(account); // wallet address
        if(!exists<Message>(signer_address)){
            // if no message instance exists
            // creating new message instance
            let message = Message {
                my_message: msg,
            };
            move_to(account, message);  // create method
            // move_to()
            // move_from()
            // borrow_global() // for read
            // borrow_global_mut() // for update
        } else {
            let message = borrow_global_mut<Message>(signer_address); // for updating the address instance - if already message exists
            message.my_message = msg;
        }
    }
    #[test(admin = @0x1234)]
    public entry fun test_store_message(admin: signer) acquires Message {
        account::create_account_for_test(signer::address_of(&admin));
        store_message(&admin, utf8(b"Hello for the first time!"));
        store_message(&admin, utf8(b"Hello for the second time!"));
        let message = borrow_global<Message>(signer::address_of(&admin));
        assert!(message.my_message == utf8(b"Hello for the second time!")); // assert is mainly used in Typescript
    }
}

// ownership, borrow (assignment), reference (address)
// struct - key value pairs - custom data type - structs are called as resources
// used for object instances, but can't add functions

// struct's ability - copy, drop, store, key - used for objects instances

// manage ownership methods - used for CRUD operations - move_to(), move_from(), borrow_global(), borrow_global_mut()
// signer object - whose information is represented, who called the function
// imp role in authentication and authorization

// T - to be mapped using signer

// gas fee optimization - smart contract auditors

// mapping 

// for deploying - aptos move deploy 
// for compiling - aptos move compile
// Transaction submitted: https://explorer.aptoslabs.com

// GUI dev tool - https://www.zeromove.in/
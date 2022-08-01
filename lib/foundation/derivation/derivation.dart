/// the derivation folder is like a service, holding functional code to perform
/// address derivations. We must perform address derviations on the device to
/// verify the addresses, such as the change and receive addresses the server
/// gives us. This is a service in the foundation because when triggered it 
/// merely saves its derviations to the database.
/// 
/// the process looks like this:
/// - we start the app
/// - we load wallets from the database to the cache
///   - if there are no wallets, we make one and save it to cache and database
///   - then we would normally derive addresses, but we don't.
/// unlike v1 we don't have to do anything special during this process
/// like checking each address for transactions.
/// instead we merely
/// - checkin with the server, proving the public key of the wallets we have.
/// - while we wait for a response we can start deriving address after address
/// - but we wont save them until the server tells us how many we should derive.
/// - then we'll save that many addresses to database and cache
/// - we can then subscribe to certain types of data. 
/// - whenever it gives us a new address object, which is will on a new tx
///   - we'll derive the same address so we know it's private key.
/// - as far as subscriptions go...
///   - the first one we subscribe to is holdings.
///   - then transactions
///   - ...but this is out side the scope of the derviation process now.